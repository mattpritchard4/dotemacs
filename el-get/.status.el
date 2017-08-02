((alert status "installed" recipe
	(:name alert :description "Growl-style notification system for Emacs" :website "https://github.com/jwiegley/alert" :type github :pkgname "jwiegley/alert" :prepare
	       (progn
		 (autoload 'alert "alert" "Alert the user that something has happened.")
		 (autoload 'alert-add-rule "alert" "Programmatically add an alert configuration rule."))))
 (circe status "installed" recipe
	(:name circe :website "https://github.com/jorgenschaefer/circe/wiki" :description "Circe is a Client for IRC in Emacs with sane defaults" :type github :pkgname "jorgenschaefer/circe" :depends cl-lib :load-path
	       (".")))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (emojify status "installed" recipe
	  (:name emojify :description "Display emojis in Emacs." :type github :depends
		 (seq ht)
		 :minimum-emacs-version "24.3" :pkgname "iqbalansari/emacs-emojify"))
 (ht status "installed" recipe
     (:name ht :website "https://github.com/Wilfred/ht.el" :description "The missing hash table utility library for Emacs." :type github :pkgname "Wilfred/ht.el"))
 (oauth2 status "installed" recipe
	 (:name oauth2 :description "OAuth 2.0 Authorization Protocol" :type elpa))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "https://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :features package :post-init
		 (progn
		   (let
		       ((old-package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))))
		     (when
			 (file-directory-p old-package-user-dir)
		       (add-to-list 'package-directory-list old-package-user-dir)))
		   (setq package-archives
			 (bound-and-true-p package-archives))
		   (let
		       ((protocol
			 (if
			     (and
			      (fboundp 'gnutls-available-p)
			      (gnutls-available-p))
			     "https://"
			   (lwarn
			    '(el-get tls)
			    :warning "Your Emacs doesn't support HTTPS (TLS)%s"
			    (if
				(eq system-type 'windows-nt)
				",\n  see https://github.com/dimitri/el-get/wiki/Installation-on-Windows." "."))
			   "http://"))
			(archives
			 '(("melpa" . "melpa.org/packages/")
			   ("gnu" . "elpa.gnu.org/packages/")
			   ("marmalade" . "marmalade-repo.org/packages/"))))
		     (dolist
			 (archive archives)
		       (add-to-list 'package-archives
				    (cons
				     (car archive)
				     (concat protocol
					     (cdr archive)))))))))
 (request status "installed" recipe
	  (:name request :description "Easy HTTP request for Emacs Lisp" :type github :submodule nil :pkgname "abingham/emacs-request" :depends
		 (deferred)
		 :provide
		 (request-deferred)))
 (seq status "installed" recipe
      (:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
 (slack status "installed" recipe
	(:name slack :description "Slack client for emacs" :type github :pkgname "yuya373/emacs-slack" :depends
	       (websocket request oauth2 circe alert emojify)))
 (websocket status "installed" recipe
	    (:name websocket :description "A websocket implementation in elisp, for emacs." :type github :pkgname "ahyatt/emacs-websocket")))
