# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  version "1.1.0"
  license "Apache-2.0"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/1.1.0/twitch-cli_1.1.0_Darwin_x86_64.tar.gz"
    sha256 "c25e3ae78c7d2437b1585c5e8a407fca336ba173326ed9245c919115661f3ed3"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/1.1.0/twitch-cli_1.1.0_Linux_x86_64.tar.gz"
    sha256 "291957f9cdc17d32a7fd654aa37035d14f7b2212880594a06574b26e9b06a291"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/twitchdev/twitch-cli.git", tag: "1.1.0"
    depends_on "go" => :build
  end

  head "https://github.com/twitchdev/twitch-cli.git", branch: "main"
  head do
    depends_on "go" => :build
  end

  def install
    v = version
    if build.head?
      v = "head"
      ldflags = "-X main.buildVersion=#{v}"
      system "go", "build", "-ldflags=#{ldflags}"
      mv "twitch-cli", "twitch"
    end

    if OS.mac? && Hardware::CPU.arm?
      ldflags = "-X main.buildVersion=#{v}"
      system "go", "build", "-ldflags=#{ldflags}"
      mv "twitch-cli", "twitch"
    end

    bin.install "twitch"
  end

  test do
    system "#{bin}/twitch", "version"
  end
end
