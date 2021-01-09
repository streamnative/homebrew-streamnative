class Pulsar < Formula
  desc "Distributed pub-sub messaging platform with a very flexible messaging model"
  homepage "https://github.com/streamnative/pulsar"
  url "https://mirror.dkm.cz/apache/pulsar/pulsar-2.6.1/apache-pulsar-2.6.1-bin.tar.gz"
  sha256 "f3c332c0cc0c1ab27040614842042da8009be18c521e44a446364eabf2d46290"

  def install
    libexec.install Dir["*"]
  end

  def caveats
    <<-EOS
    In order to use the pulsar, please add the pulsar directory #{rack}/#{installed_version}/libexec/bin to
    the system PATH.

    export PATH=${PATH}:#{rack}/#{installed_version}/libexec/bin

    Happy Pulsaring
    EOS
  end

  test do
    system "#{rack}/libexec/bin/pulsar", "--help"
  end
end
