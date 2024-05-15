class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.2.1.3/pulsarctl-amd64-darwin.tar.gz"
      sha256 "944e0e190aa5c5c4b7a8f1020b1d2fa81755199009a71d8c1eb5c89bd30b517c"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.2.1.3/pulsarctl-arm64-darwin.tar.gz"
      sha256 "e76be082b6e1532bf04aa52f37670ac94d5d12ca0dd77474de05e488736e2e71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.2.1.3/pulsarctl-amd64-linux.tar.gz"
      sha256 "a633252950b18f2bc995dc30d09e850f97ab30360ee7a1a4d3461c3db88642df"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.2.1.3/pulsarctl-arm64-linux.tar.gz"
      sha256 "a56be89a8e5ce99d9860c4944eb0896b2062034617b1575bf931d6fa28944dbc"
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
