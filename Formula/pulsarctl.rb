class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.8.0.16/pulsarctl-amd64-darwin.tar.gz"
      sha256 "eb7f74f67ff198182a969db5131626143df4e7a6d44cf14c06ce380fc42b5c07"
    else
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.8.0.16/pulsarctl-arm64-darwin.tar.gz"
      sha256 "276382eee5cfd607cc6ae7caec315d258d0a2b35cd41c69f77962f9a011c7d63"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.8.0.16/pulsarctl-amd64-linux.tar.gz"
      sha256 "eb5857ba6dd0a2f90011660665625f3cbcd97e6266029f2e1e6e8ce86eb74793"
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
