{ nixpkgs ? <nixpkgs>
, packages 
, additionalProfile ? ""
, command ?  "bash"
}:

with import nixpkgs {};

let fhs = pkgs.buildFHSUserEnv {
  name = "chroot-env";
  targetPkgs = pkgs: (import packages);

  runScript = command;
  profile = ''
    unset SSL_CERT_FILE
    export LANG=en_US.UTF-8
    export TERM=xterm
    export SHELL=/usr/bin/bash
  '' + "\n" + additionalProfile;
};
in stdenv.mkDerivation {
  name = "chroot-env-shell";
  nativeBuildInputs = [ fhs ];
  shellHook = ''
    exec chroot-env
  '';
}
