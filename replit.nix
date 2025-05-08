{ pkgs }: {
  deps = [
    pkgs.zip
    pkgs.openssh
    pkgs.love
    pkgs.libGL
    pkgs.libGLU
  ];
}