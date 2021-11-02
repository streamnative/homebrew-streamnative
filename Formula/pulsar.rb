class Pulsar < Formula
  desc "Distributed pub-sub messaging platform with a very flexible messaging model"
  homepage "https://pulsar.apache.org"
  url "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=pulsar/pulsar-2.8.1/apache-pulsar-2.8.1-bin.tar.gz"
  sha256 "aafd4a835ff100bde3df37220bfb950ce4dfb3c68f74680ba6c3bdd1cc3904cb"
  license "Apache-2.0"

  depends_on "openjdk" => :optional

  def install
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/pulsar"]
    bin.write_exec_script Dir["#{libexec}/bin/pulsar-admin"]
    bin.write_exec_script Dir["#{libexec}/bin/pulsar-client"]
    bin.write_exec_script Dir["#{libexec}/bin/pulsar-daemon"]
    bin.write_exec_script Dir["#{libexec}/bin/pulsar-perf"]
  end

  plist_options manual: "pulsar standalone"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>KeepAlive</key>
          <false/>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/pulsar</string>
            <string>standalone</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>WorkingDirectory</key>
          <string>#{var}</string>
          <key>StandardErrorPath</key>
          <string>#{var}/log/pulsar.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/pulsar.log</string>
        </dict>
      </plist>
    EOS
  end

  test do
    system "#{bin}/pulsar", "--help"
  end
end
