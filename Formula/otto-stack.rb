class OttoStack < Formula
  desc "Development stack management tool for streamlined local development automation"
  homepage "https://github.com/otto-nation/otto-stack"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/otto-nation/otto-stack/releases/download/v1.2.0/otto-stack-darwin-amd64"
      sha256 "a18c2413f76fcfa2b19d489843c5f738266aada7b74ed6098c508977bd4e5d93"
    end

    on_arm do
      url "https://github.com/otto-nation/otto-stack/releases/download/v1.2.0/otto-stack-darwin-arm64"
      sha256 "da438993a385d3832db1019e884ed9f9f972c54551668b452820594efec8ed47"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/otto-nation/otto-stack/releases/download/v1.2.0/otto-stack-linux-amd64"
      sha256 "cd789a83526815b4a50c7bdd0d356d80280f70a412427d0c81b62b6b0aa184a9"
    end

    on_arm do
      url "https://github.com/otto-nation/otto-stack/releases/download/v1.2.0/otto-stack-linux-arm64"
      sha256 "ca387168777c044db51e232c046438e883d41765a7e36a683b2b236728bc56f8"
    end
  end

  def install
    case Hardware::CPU.arch
    when :x86_64
      arch_suffix = "amd64"
    when :arm64
      arch_suffix = "arm64"
    else
      raise "Unsupported architecture: #{Hardware::CPU.arch}"
    end

    os_name = OS.mac? ? "darwin" : "linux"
    binary_name = "otto-stack-#{os_name}-#{arch_suffix}"

    bin.install binary_name => "otto-stack"
  end

  def caveats
    <<~EOS
      To get started with otto-stack:
        otto-stack init

      For more information:
        otto-stack --help

      Documentation: https://otto-nation.github.io/otto-stack/
    EOS
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/otto-stack --version"))

    # Test basic functionality
    system bin/"otto-stack", "--help"

    # Test that the binary is properly linked
    assert_path_exists bin/"otto-stack"
    assert_predicate bin/"otto-stack", :executable?
  end
end
