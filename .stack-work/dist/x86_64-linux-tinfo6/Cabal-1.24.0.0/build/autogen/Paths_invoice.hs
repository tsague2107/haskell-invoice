{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_invoice (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/tsague/Bureau/haskell-invoice/.stack-work/install/x86_64-linux-tinfo6/a33d96fd2f2d47ac8fcddd001afbedc8e9ac3dc9c4963eff367c30504ac97f03/8.0.1/bin"
libdir     = "/home/tsague/Bureau/haskell-invoice/.stack-work/install/x86_64-linux-tinfo6/a33d96fd2f2d47ac8fcddd001afbedc8e9ac3dc9c4963eff367c30504ac97f03/8.0.1/lib/x86_64-linux-ghc-8.0.1/invoice-0.0.0.1"
datadir    = "/home/tsague/Bureau/haskell-invoice/.stack-work/install/x86_64-linux-tinfo6/a33d96fd2f2d47ac8fcddd001afbedc8e9ac3dc9c4963eff367c30504ac97f03/8.0.1/share/x86_64-linux-ghc-8.0.1/invoice-0.0.0.1"
libexecdir = "/home/tsague/Bureau/haskell-invoice/.stack-work/install/x86_64-linux-tinfo6/a33d96fd2f2d47ac8fcddd001afbedc8e9ac3dc9c4963eff367c30504ac97f03/8.0.1/libexec"
sysconfdir = "/home/tsague/Bureau/haskell-invoice/.stack-work/install/x86_64-linux-tinfo6/a33d96fd2f2d47ac8fcddd001afbedc8e9ac3dc9c4963eff367c30504ac97f03/8.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "invoice_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "invoice_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "invoice_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "invoice_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "invoice_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
