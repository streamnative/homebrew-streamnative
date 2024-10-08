class Pulsar < Formula
  desc "Distributed pub-sub messaging platform with a very flexible messaging model"
  homepage "https://pulsar.apache.org"
  url "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=pulsar/pulsar-3.3.1/apache-pulsar-3.3.1-bin.tar.gz"
  sha256 "12973876d8a5d4cfef835751fa1ac06bbe2408171a462b02954ac9aa35255a69"
  license "Apache-2.0"

  depends_on "openjdk" => :optional

  def install
    libexec.install Dir["bin", "lib", "instances", "conf"]

    rm_r(libexec/"lib/presto/bin/procname/Linux-ppc64le")
    pkgshare.install Dir["examples", "licenses"]
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
    run [opt_bin/"pulsar", "standalone"]
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
