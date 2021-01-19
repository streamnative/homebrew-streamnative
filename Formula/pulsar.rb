class Pulsar < Formula
  desc "Distributed pub-sub messaging platform with a very flexible messaging model"
  homepage "https://github.com/streamnative/pulsar"
  url "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=pulsar/pulsar-2.7.0/apache-pulsar-2.7.0-bin.tar.gz"
  sha256 "bb13827a6461d84b43cc83264bbbcdcfd2338a3ae84fdf5aeb2327a6fd48d0fc"

  def install
    libexec.install Dir["*"]
  end

  def caveats
    <<-EOS
    In order to use the pulsar, please add the pulsar directory #{rack}/2.7.0/libexec/bin to
    the system PATH.

    export PATH=${PATH}:#{rack}/2.7.0/libexec/bin

    Happy Pulsaring
    EOS
  end

  test do
    system "#{rack}/2.7.0/libexec/bin/pulsar", "--help"
  end
end
