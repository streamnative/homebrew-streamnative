class PfsqlCli < Formula
  desc "StreamNative pfSQL CLI (pfsql-cli)"
  homepage "https://streamnative.io/"
  version "0.17.0"
  license "Apache-2.0"

  depends_on "curl"

  on_macos do
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/artifacts.affable-ray-226821.appspot.com/pfsql-cli/v0.17.0/pfsql-cli-aarch64-apple-darwin.tar.gz"
      sha256 "a29d8c7b200caceaaf4de0ed921987d76d1afd06c04016dd7dbfbc25e34b9ab6"

      def install
        bin.install "pfsql-cli-aarch64-apple-darwin" => "pfsql"
      end
    end
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/artifacts.affable-ray-226821.appspot.com/pfsql-cli/v0.17.0/pfsql-cli-x86_64-apple-darwin.tar.gz"
      sha256 "45cd48c05a046cde87b3fe11a45ef369548aa02236b57d4d273c79e53b6dd5f7"

      def install
        bin.install "pfsql-cli-x86_64-apple-darwin" => "pfsql"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/artifacts.affable-ray-226821.appspot.com/pfsql-cli/v0.17.0/pfsql-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19a13f0b5b469815cf5b67fe67a34eee97fc62f9492f587023d2e4f408d7e8a1"

      def install
        bin.install "pfsql-cli-x86_64-unknown-linux-gnu" => "pfsql"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://storage.googleapis.com/artifacts.affable-ray-226821.appspot.com/pfsql-cli/v0.17.0/pfsql-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "65a5835b9c315318b4f0a1c99611513906293c30871d9f1f2fa3f89649983ca7"

      def install
        bin.install "pfsql-cli-aarch64-unknown-linux-gnu" => "pfsql"
      end
    end
  end
end
