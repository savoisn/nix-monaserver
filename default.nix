let
  pkgs = import <nixpkgs> { system = builtins.currentSystem; };

in
pkgs.stdenv.mkDerivation rec {

  nativeBuildInputs = with pkgs; [ gcc clang openssl luajit ];

  pname = "monaserver";

  version = "1.2";

  src = builtins.fetchGit {
    url = "https://github.com/MonaSolutions/MonaServer2.git";
    ref = "master";
    # owner = "MonaSolutions";
    # repo = "MonaServer";
    rev = "5490a5814d00528b043da1005d65e08686e212e1";
    # sha256 = "";
  };

  # buildPhase = ''
  #   cd MonaBase
  #   make 
  #   cd ../MonaCore
  #   make
  #   cd ../MonaServer
  #   make
  #   '';

  installPhase = ''
        mkdir -p $out/bin
        mkdir -p $out/lib
        cp MonaBase/lib/libMonaBase.so MonaCore/lib/libMonaCore.so $out/lib
    	cp MonaServer/MonaServer MonaTiny/cert.pem MonaTiny/key.pem $out/bin
  '';

  fixupPhase = ''
    echo "nothing to do"
  '';


  meta = with pkgs.lib; {
    license = licenses.gpl3Plus;
  };

}
