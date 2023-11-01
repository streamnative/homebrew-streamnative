class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.1.0.2/pulsarctl-amd64-darwin.tar.gz"
      sha256 "b57edf246a5ddca16d81365e36d325638eee0062eccb39f27b6cf3074c10cc76"
    else
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.1.0.2/pulsarctl-arm64-darwin.tar.gz"
      sha256 "5a18363f4aa9f89ca8908221c0477d70d78dafb3f1c8f9d9922ae9b8fcb89c99"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v3.1.0.2/pulsarctl-amd64-linux.tar.gz"
      sha256 "d27d3a346617f87e35df3bcbde7f71b87d8949f829489cf0bf7f566a0da458fe"
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
