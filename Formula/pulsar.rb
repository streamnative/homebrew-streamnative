class Pulsar < Formula
  desc "Pulsar is a distributed pub-sub messaging platform with a very flexible messaging model and an intuitive client API."
  homepage "https://github.com/streamnative/pulsar"
  url "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=pulsar/pulsar-2.5.0/apache-pulsar-2.5.0-bin.tar.gz"
  sha256 "721b12c6fa7d87cbf2763d2b7c3ffc0c5395d2cb1f3760e9ae33d6f8c650a064"

  def install
    libexec.install Dir["*"]
  end

  def caveats
    s = <<-EOS
    In order to use the pulsar, please add the pulsar directory #{rack}/#{installed_version}/libexec/bin to
    the system PATH.

    export PATH=${PATH}:#{rack}/#{installed_version}/libexec/bin

    Happy Pulsaring
    EOS
    s
  end

  test do
    system "#{rack}/libexec/bin/pulsar", "--help"
  end
end
