class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.9.2.3/pulsarctl-amd64-darwin.tar.gz"
      sha256 "2c311141289ca16f791840df21bd80496b1bdb66c5d25e80c06bd671d436cb35"
    else
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.9.2.3/pulsarctl-arm64-darwin.tar.gz"
      sha256 "0fbb758fdd3d31c3986cd586c9e4a547abda0687315971e4c06f59e6692d47f4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.9.2.3/pulsarctl-amd64-linux.tar.gz"
      sha256 "2ed5ae9b1ab078331110add2c61f157f62d154be9db303437d9edc17251312a6"
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
