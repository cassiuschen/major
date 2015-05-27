::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "RMIAMLgAOmGfbRNxVz0TtzyJ93508b42ShZeE40s"
  config.qiniu_secret_key    = 'SsQT2tLHiskrsIZWLcPxiZxiSWU6i499_jljoUla'
  config.qiniu_bucket        = "major-data"
  config.qiniu_bucket_domain = "7xjbe0.com1.z0.glb.clouddn.com"
  config.qiniu_bucket_private= false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"#

#  #config.qiniu_up_host       = 'http://up.qiniug.com' #七牛上传海外服务器,国内使用可以不要这行配置
end