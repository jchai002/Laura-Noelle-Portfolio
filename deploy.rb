git_head = `echo $(git symbolic-ref --short HEAD)`
env = git_head.gsub("\n",'')

ENV['S3_ID']=""

ENV['S3_SECRET']=""

case env
  when 'staging'
    ENV['S3_BUCKET'] = ""
  when 'production'
    ENV['S3_BUCKET'] = ""
end

exec("echo Building blog && bundle exec jekyll build && echo Deploying blog to s3 && bundle exec s3_website push")
