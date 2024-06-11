class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.3.0.1/pulsarctl-amd64-darwin.tar.gz"
      sha256 "30e0ac5341019c6b631377376aae7a9d3279ade6e2d08bd640e2290c90f0ccac"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.3.0.1/pulsarctl-arm64-darwin.tar.gz"
      sha256 "7b93032b67b238d5cdc673888967c5e4279830b023866f4435e618e328797f41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.3.0.1/pulsarctl-amd64-linux.tar.gz"
      sha256 "0d82bfed374f0525e75804044871d5d85d6015ba7ce0d7905d1b6a26ffc73c79"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.3.0.1/pulsarctl-arm64-linux.tar.gz"
      sha256 "39d00acb0dd514037490b6af6a0eacdf4657b16eac7578990af9d782f05e3fcf"
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
