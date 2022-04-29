{
    "subject": {
        "commonName": "{{ .Subject.CommonName }}",
        "country": "FR",
        "organization": "Torque",
        "organizationalUnit": "Homelab"
    },
    "sans": {{ toJson .SANs }},
{{- if typeIs "*rsa.PublicKey" .Insecure.CR.PublicKey }}
    "keyUsage": ["keyEncipherment", "digitalSignature"],
{{- else }}
    "keyUsage": ["digitalSignature"],
{{- end }}
    "extKeyUsage": ["serverAuth", "clientAuth"]
}
