function for_kube_log(tag, timestamp, record)
    if ( record.kubernetes ~= nil ) then
        record.namespace = record.kubernetes.namespace_name
        record.pod = record.kubernetes.pod_name
        record.container = record.kubernetes.container_name
        if ( record.kubernetes.labels ~= nil ) then
            record.app = record.kubernetes.labels.app
        end
        record.topic = string.format('%s.%s', record.namespace, 'std')
    end
    record.cluster = os.getenv('CLUSTER')
    return 2, timestamp, record
end
