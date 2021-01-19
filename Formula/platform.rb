class Platform < Formula
  desc "Distributed pub-sub messaging platform with a very flexible messaging model"
  homepage "https://github.com/streamnative/pulsar"
  url "https://github.com/streamnative/sn-platform/releases/download/v1.0.0/sn-platform-all-v1.0.0-darwin-amd64.tar.gz"
  sha256 "e4d680706ad2964855abbb5329ebd5b695b83807d7be4fa94adf2be2b5185e53"

  def install
    libexec.install Dir["*"]
  end

  def caveats
    <<-EOS
    In order to use the platform, please add the pulsar directory #{rack}/1.0.0/libexec/bin to
    the system PATH.

    export PATH=${PATH}:#{rack}/1.0.0/libexec/bin
    EOS
  end

  test do
    system "#{rack}/64/libexec/bin/pulsar", "--help"
  end
end
