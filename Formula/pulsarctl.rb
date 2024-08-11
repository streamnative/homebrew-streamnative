class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.3.0.9/pulsarctl-amd64-darwin.tar.gz"
      sha256 "bb9d4ec15de5d97e61c39c5ef9ea834207dfe55a3f1dda9e6fd2379edef4b157"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.3.0.9/pulsarctl-arm64-darwin.tar.gz"
      sha256 "1579ac8fb97f71ca986dd948d31c9d257b65de01beb421970e456e0b3b93de4b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.3.0.9/pulsarctl-amd64-linux.tar.gz"
      sha256 "fd56debb7d3aba5d0cbb1c4e98185c1554223065b8a8d2f4024157d7d851282c"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.3.0.9/pulsarctl-arm64-linux.tar.gz"
      sha256 "84b8bdf57290d5da534e24ba5cefe6b8f02113e352e372122546a2b3ffdc47b4"
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
