class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v4.1.3.4/pulsarctl-amd64-darwin.tar.gz"
      sha256 "d83441a5fc9dd2adf9ab0cf4205393ae0cac463355d841fa8dffd0813e23ad3c"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v4.1.3.4/pulsarctl-arm64-darwin.tar.gz"
      sha256 "ec8eb528d03f0dbf2db92aa7b2b89c5e62f3d7e8fa8f571e223f745c366bc2d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v4.1.3.4/pulsarctl-amd64-linux.tar.gz"
      sha256 "3f433ec2ed8be3e7f853f968697b4825ba97e96acf9725a61d833a79cef7ed64"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v4.1.3.4/pulsarctl-arm64-linux.tar.gz"
      sha256 "f4beb13f954cb1122082c4c04e55aacf4b3d2172ebb23ae8ada0f4af015815a3"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/pulsarctl"]
    bin.write_exec_script Dir["#{libexec}/plugins/pulsarctl-security_tool"]

    # Install completions
    (prefix/"completions").mkdir

    system "#{libexec}/pulsarctl completion zsh > #{prefix}/completions/_pulsarctl"
    system "#{libexec}/pulsarctl completion bash > #{prefix}/completions/pulsarctl.bash"

    zsh_completion.install "#{prefix}/completions/_pulsarctl"
    bash_completion.install "#{prefix}/completions/pulsarctl.bash"

    rmdir prefix/"completions"
  end

  test do
    out = shell_output("#{bin}/pulsarctl 2>&1")
    assert_match "a CLI for Apache Pulsar", out
  end
end
