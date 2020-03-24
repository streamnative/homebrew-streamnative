class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  url "https://github.com/streamnative/pulsarctl.git",
      :tag      => "v0.4.0",
      :revision => "d1c0c2853572e1b0a8e676ec135c81c1b9690eb6"
  sha256 "d0d6b55017cf349dd893248b0541c8026db9be5d5a7c5523d7bb91426c279fe3"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin / "pulsarctl"
    if !File::directory?("~/.pulsarctl")
      system "mkdir", "-p", "~/.pulsarctl"
    end
    system "cp", "-r", "plugins", "~/.pulsarctl"
  end

  test do
    out = shell_output("#{bin}/pulsarctl 2>&1")
    assert_match "a CLI for Apache Pulsar", out
  end

  puts "In order to use this plugins, please add the plugin directory '${plugins_dir}' to the system PATH. You can do so by adding the following line to your bash profile."
  puts ""
  puts "export PATH=${PATH}:${HOME}/.pulsarctl/plugins"
  puts ""
  puts "Happy Pulsaring!"

end
