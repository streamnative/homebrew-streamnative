class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  url "https://github.com/streamnative/pulsarctl.git",
      tag:      "v0.5.0",
      revision: "615bbc787af151c1f872fdc4c5e048ac562b9618"
  sha256 "d0d6b55017cf349dd893248b0541c8026db9be5d5a7c5523d7bb91426c279fe3"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin / "pulsarctl"
    mkdir share / "plugins"
    cp "plugins/", share / "plugins"

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
