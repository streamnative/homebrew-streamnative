class PfsqlCli < Formula
  desc "StreamNative pfSQL CLI (pfsql-cli)"
  homepage "https://streamnative.io/"
  version "0.18.0"
  license "Apache-2.0"

  depends_on "curl"

  on_macos do
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/artifacts.affable-ray-226821.appspot.com/pfsql-cli/v0.18.0/pfsql-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d06fafd0d213362ab2ac734bea29db8bf506894421210cad87ad4bb941e5e58a"

      def install
        bin.install "pfsql-cli-aarch64-apple-darwin" => "pfsql"
      end
    end
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/artifacts.affable-ray-226821.appspot.com/pfsql-cli/v0.18.0/pfsql-cli-x86_64-apple-darwin.tar.gz"
      sha256 "112d00ee606d6ad4d83a9cd0ea75fce4f384f24fc0b0a054f135fc15ecf21ec4"

      def install
        bin.install "pfsql-cli-x86_64-apple-darwin" => "pfsql"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://storage.googleapis.com/artifacts.affable-ray-226821.appspot.com/pfsql-cli/v0.18.0/pfsql-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b27ad8f40daa8737742fa1cc708486afe69dda318824ca693981457ea3eb404d"

      def install
        bin.install "pfsql-cli-x86_64-unknown-linux-gnu" => "pfsql"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://storage.googleapis.com/artifacts.affable-ray-226821.appspot.com/pfsql-cli/v0.18.0/pfsql-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d88d615f9effe555c5291bd86fe013224f1fda62cd6eaf62dd369a779a63246a"

      def install
        bin.install "pfsql-cli-aarch64-unknown-linux-gnu" => "pfsql"
      end
    end
  end
end
