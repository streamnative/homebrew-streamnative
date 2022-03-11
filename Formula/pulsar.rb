class Pulsar < Formula
  desc "Distributed pub-sub messaging platform with a very flexible messaging model"
  homepage "https://pulsar.apache.org"
  url "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=pulsar/pulsar-2.9.1/apache-pulsar-2.9.1-bin.tar.gz"
  sha256 "485833c8459548188e4c4c106476ee02628bf7d88438ec8ccfaa85e56691f7ca"
  license "Apache-2.0"

  depends_on "openjdk" => :optional

  def install
    libexec.install Dir["bin"], Dir["lib"], Dir["instances"], Dir["conf"]

    (libexec/"lib/presto/bin/procname/Linux-ppc64le").rmtree
    pkgshare.install Dir["examples"], Dir["licenses"]
    (etc/"pulsar").install_symlink libexec/"conf"

    bin.write_exec_script Dir["#{libexec}/bin/pulsar"]
    bin.write_exec_script Dir["#{libexec}/bin/pulsar-admin"]
    bin.write_exec_script Dir["#{libexec}/bin/pulsar-client"]
    bin.write_exec_script Dir["#{libexec}/bin/pulsar-daemon"]
    bin.write_exec_script Dir["#{libexec}/bin/pulsar-perf"]
  end

  def post_install
    (var/"log/pulsar").mkpath
  end

  service do
    run [bin/"pulsar", "standalone"]
    log_path var/"log/pulsar/output.log"
    error_log_path var/"log/pulsar/error.log"
  end

  test do
    fork do
      exec bin/"pulsar", "standalone", "--zookeeper-dir", "#{testpath}/zk", " --bookkeeper-dir", "#{testpath}/bk"
    end
    # The daemon takes some time to start; pulsar-client will retry until it gets a connection, but emit confusing
    # errors until that happens, so sleep to reduce log spam.
    sleep 15

    output = shell_output("#{bin}/pulsar-client produce my-topic --messages 'hello-pulsar'")
    assert_match "1 messages successfully produced", output
    output = shell_output("#{bin}/pulsar initialize-cluster-metadata -c a -cs localhost -uw localhost -zk localhost")
    assert_match "Cluster metadata for 'a' setup correctly", output
  end
end
