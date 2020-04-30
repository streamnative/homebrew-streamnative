class Platform < Formula
  desc "Pulsar is a distributed pub-sub messaging platform with a very flexible messaging model and an intuitive client API."
  homepage "https://github.com/streamnative/pulsar"
  url "https://github.com/streamnative/sn-platform/releases/download/v1.0.0/sn-platform-all-v1.0.0-darwin-amd64.tar.gz"
  version "v1.0.0"

  depends_on "curl"

  def install
    prefix.install Dir["*"]
  end

  def caveats
    s = <<-EOS
    In order to use the platform, please add the pulsar directory #{rack}/#{installed_version}/bin to
    the system PATH.

    export PATH=${PATH}:#{rack}/#{installed_version}/bin
    EOS
    s
  end

  test do
    system "#{rack}/#{installed_version}/bin/pulsar", "--help"
  end
end
