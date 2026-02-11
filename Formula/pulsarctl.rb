class Pulsarctl < Formula
  desc "CLI for Apache Pulsar written in golang"
  homepage "https://streamnative.io/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v4.0.8.8/pulsarctl-amd64-darwin.tar.gz"
      sha256 "8645c432bb1e2c9b06a9d982cf0e4b99e052f1b495b4a76121b453d466803efb"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v4.0.8.8/pulsarctl-arm64-darwin.tar.gz"
      sha256 "e2965b9a9fd24fcadd76edc138bc76f8743620994a435d689195d445101337f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/streamnative/pulsarctl/releases/download/v4.0.8.8/pulsarctl-amd64-linux.tar.gz"
      sha256 "10b8893964e2bd2b010f308970902a0c51be4734e8f2539b78d91f93906d30a6"
    end
    on_arm do
      url "https://github.com/streamnative/pulsarctl/releases/download/v4.0.8.8/pulsarctl-arm64-linux.tar.gz"
      sha256 "b3aa2ea52fcfe6ff671b8a4a6750fb4ae0d727cb7f247aaf6cad5c695c223822"
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
