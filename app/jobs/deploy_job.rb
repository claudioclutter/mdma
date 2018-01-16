require 'slack'

class DeployJob < ActiveJob::Base
  queue_as :default

  def perform(build)
    app = SimpleMDM::App.find 16714
    file = Tempfile.open ['package', '.ipa'], encoding: 'ASCII-8BIT'
    file.write build.package.download
    app.binary = file.open
    app.save

    app_group = SimpleMDM::AppGroup.find 21708 # 7017
    app_group.push_apps
    build.successful!
  end
end
