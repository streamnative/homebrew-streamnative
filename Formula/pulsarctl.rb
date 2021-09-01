class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.8.0.15/pulsarctl-amd64-darwin.tar.gz"
      sha256 "2e05d525b012d713b9befab1a8c2cd680a53a3441df78a65fff8d2886ec5f443"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.8.0.15/pulsarctl-amd64-linux.tar.gz"
      sha256 "c3e0df2b09ebaf2383dd502b10437473168d029c71fda897d7283759518289f7"
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
