class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  url "https://github.com/streamnative/pulsarctl/releases/download/v2.7.0.2/pulsarctl-amd64-darwin.tar.gz"

  def install
    bin.install "pulsarctl"
    share.install "plugins"

    puts "In order to use this plugins, please add the plugin directory '#{share}/plugins' to the system PATH. " \
             "You can do so by adding the following line to your bash profile."
    puts ""
    puts "export PATH=${PATH}:#{share}/plugins"
    puts ""
    puts "Happy Pulsaring!"
  end

  test do
    out = shell_output("#{bin}/pulsarctl 2>&1")
    assert_match "a CLI for Apache Pulsar", out
  end
end
