# Homebrew formula for Mangiafuoco
# Parallel development orchestration toolkit
#
# Install: brew install jellylabs-ltd/tap/mangiafuoco
# Or: brew tap jellylabs-ltd/tap && brew install mangiafuoco

class Mangiafuoco < Formula
  desc "Parallel development orchestration toolkit for Claude Code agents"
  homepage "https://github.com/jellylabs-ltd/conductor"
  version "0.1.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jellylabs-ltd/conductor/releases/download/v#{version}/mangiafuoco-#{version}-arm64.tar.gz"
    sha256 "PLACEHOLDER_ARM64_SHA256"
  else
    url "https://github.com/jellylabs-ltd/conductor/releases/download/v#{version}/mangiafuoco-#{version}-x86_64.tar.gz"
    sha256 "PLACEHOLDER_X86_64_SHA256"
  end

  def install
    bin.install "mangiafuoco"
    bin.install "mangiafuoco-daemon"
    
    # Create mf shortcut symlink
    bin.install_symlink "mangiafuoco" => "mf"
    
    # Generate and install shell completions
    generate_completions_from_executable(bin/"mangiafuoco", "completions")
  end

  def caveats
    <<~EOS
      Mangiafuoco has been installed!
      
      Quick start:
        mf status              # Show status overview
        mf watch               # Live monitoring
        mf daemon start        # Start background daemon
        mf projects add .      # Register current directory
      
      The short command 'mf' is available as an alias for 'mangiafuoco'.
      
      To start the daemon automatically at login:
        brew services start mangiafuoco
      
      For shell completions, add to your shell config:
        Fish: mf completions fish > ~/.config/fish/completions/mf.fish
        Zsh:  mf completions zsh > ~/.zsh/completions/_mf
        Bash: mf completions bash > ~/.bash_completion.d/mf
    EOS
  end

  service do
    run [opt_bin/"mangiafuoco-daemon", "--foreground"]
    keep_alive true
    log_path var/"log/mangiafuoco.log"
    error_log_path var/"log/mangiafuoco.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mangiafuoco --version")
    assert_match "mangiafuoco", shell_output("#{bin}/mf --help")
  end
end
