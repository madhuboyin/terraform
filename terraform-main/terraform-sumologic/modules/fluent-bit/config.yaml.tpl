config:
  extraFiles:
  %{for app_name, source_end_point in config }
     sumologic_${app_name}.conf: |
        [INPUT]
           Name            tail
           Path             /var/log/containers/*${app_name}*.log
           Tag              kube.<namespace_name>.<container_name>.<pod_name>.<docker_id>-
           Tag_Regex        (?<pod_name>[a-z0-9](?:[-a-z0-9]*[a-z0-9])?(?:\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*)_(?<namespace_name>[^_]+)_(?<container_name>.+)-(?<docker_id>[a-z0-9]{64})\.log$
           Mem_Buf_Limit    100MB
           Skip_Long_Lines   On 
           DB                /var/log/flb.db
           Buffer_Chunk_Size 100k
           Buffer_Max_Size 1M
           Skip_Empty_Lines On

        [FILTER]
           name                  multiline
           match                 kube.*${app_name}.*
           multiline.key_content textPayload
           multiline.parser      multiline_regex
           #Emitter_Mem_Buf_Limit 100MB
           buffer                off

        [FILTER]
           Name kubernetes
           Match kube.*
           Kube_Tag_Prefix kube.
           Regex_Parser kube_custom_tag
           Merge_Log On
           Merge_Log_Trim On
           Keep_Log Off
           Annotations Off
           Labels Off
           K8S-Logging.Parser On
           K8S-Logging.Exclude Off

        [FILTER]
           Name modify
           Match kube.*
           Add cluster_name ${cluster_name}
           Add location ${location}
           Add project_id ${project_id}

        [FILTER]
           Name nest
           Match kube.*
           Operation lift
           Nested_under kubernetes

        [FILTER]
           Name nest
           Match kube.*
           Operation nest
           Wildcard pod_name*
           Wildcard namespace_name*
           Wildcard container_name*
           Wildcard cluster_name* 
           Wildcard location* 
           Wildcard project_id*     
           Nest_under labels

        [FILTER]
           Name nest
           Match kube.*
           Operation nest
           Wildcard labels*
           Nest_under resource


        [FILTER]
           Name   modify
           Match  kube.*
           Remove container_image
           Remove docker_id
           Remove pod_id
           Remove container_hash
           Remove host
           Remove stream
           Rename log textPayload
           Remove time
           
        [OUTPUT]
           Name             http
           Match            kube.*.${app_name}.*
           Host             endpoint1.collection.sumologic.com
           Port             443
           URI              ${source_end_point}
           Format           json_lines
           Json_date_key    timestamp
           TLS              on
           Json_date_format iso8601
%{ endfor ~}
# The config volume is mounted by default, either to the existingConfigMap value, or the default of "fluent-bit.fullname"