class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.10.2.2/pulsarctl-amd64-darwin.tar.gz"
      sha256 "e8a16afaba6ab940715b6c66f701df6e666f24403bcfb195d801103f18f60c9b"
    else
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.10.2.2/pulsarctl-arm64-darwin.tar.gz"
      sha256 "1d52f4e9dac6e5d5d41ced6ce45e9ee0e4d0515658d006ef2e6387bb0deab40d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/streamnative/pulsarctl/releases/download/v2.10.2.2/pulsarctl-amd64-linux.tar.gz"
      sha256 "4abd4fe498186fb52c7e8c85307cf9d4956906609a8a59a091b6e8410bc9238b"
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
