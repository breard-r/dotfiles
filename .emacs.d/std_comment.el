;;
;; std_comment.el for Emacs in ~/.emacs.d
;; 
;; Made by Frederic Denis <fred@epita.fr>
;; Improved by Rodolphe Breard <rodolphe@what.tf>
;; 
;; Based on Comment routines by Isaac
;;

(global-set-key	"" 'do_insert_time)
(global-set-key	"" 'std-file-header)

(setq header-copyright	"Copyright (c) ")
(if (setq user-nickname (getenv "USER_NICKNAME"))
    t 
  (setq user-nickname (user-full-name))
  )

(setq std-c-alist               '( (cs . "/*") (cc . " * ") (ce . " */") )
      std-css-alist             '( (cs . "/*") (cc . "** ") (ce . "*/") )
      std-cpp-alist             '( (cs . "//") (cc . "// ") (ce . "//") )
      std-pov-alist             '( (cs . "//") (cc . "// ") (ce . "//") )
      std-python-alist            '( (cs . "##") (cc . "## ") (ce . "##") )
      std-java-alist            '( (cs . "//") (cc . "// ") (ce . "//") )
      std-javascript-alist      '( (cs . "//") (cc . "// ") (ce . "//") )
      std-latex-alist           '( (cs . "%%") (cc . "%% ") (ce . "%%") )
      std-lisp-alist            '( (cs . ";;") (cc . ";; ") (ce . ";;") )
      std-xdefault-alist        '( (cs . "!!") (cc . "!! ") (ce . "!!") )
      std-pascal-alist          '( (cs . "{ ") (cc . "   ") (ce . "}" ) )
      std-makefile-alist        '( (cs . "##") (cc . "## ") (ce . "##") )
      std-markdown-alist        '( (cs . "<!---") (cc . "  -- ") (ce . "-->") )
      std-text-alist            '( (cs . "##") (cc . "## ") (ce . "##") )
      std-fundamental-alist     '( (cs . "  ") (cc . "   ") (ce . "  ") )
      std-html-alist            '( (cs . "<!--") (cc . "  -- ") (ce . "-->"))
      std-php-alist             '( (cs . "<?php") (cc . "// ") (ce . "//"))
      std-nroff-alist           '( (cs . "\\\"") (cc . "\\\" ") (ce . "\\\""))
      std-sscript-alist         '( (cs . "#!/bin/sh")  (cc . "## ") (ce . "##") )
      std-perl-alist            '( (cs . "#!/usr/bin/perl -w")  (cc . "## ")(ce . "##") )
      std-cperl-alist           '( (cs . "#!/usr/bin/perl -w")  (cc . "## ")(ce . "##") )
      )


(setq std-modes-alist '(("C"                    . std-c-alist)
			("C/l"                  . std-c-alist)
                        ("CSS"                  . std-c-alist)
                        ("PoV"                  . std-pov-alist)
                        ("Py"                   . std-python-alist)
                        ("C++"                  . std-cpp-alist)
                        ("C++/l"                . std-cpp-alist)
                        ("Lisp"                 . std-lisp-alist)
                        ("Lisp Interaction"     . std-lisp-alist)
                        ("Emacs-Lisp"           . std-lisp-alist)
                        ("Fundamental"          . std-fundamental-alist)
                        ("Shell-script"         . std-sscript-alist)
                        ("Makefile"             . std-makefile-alist)
                        ("BSDmakefile"          . std-makefile-alist)
                        ("GNUmakefile"          . std-makefile-alist)
                        ("Markdown"             . std-markdown-alist)
                        ("Perl"                 . std-cperl-alist)
                        ("CPerl"                . std-cperl-alist)
                        ("xdefault"             . std-xdefault-alist)
                        ("java"                 . std-java-alist)
                        ("Java/l"               . std-java-alist)
                        ("Javascript"           . std-javascript-alist)
                        ("latex"                . std-latex-alist)
                        ("Pascal"               . stdp-ascal-alist)
                        ("Text"                 . std-text-alist)
                        ("HTML"                 . std-html-alist)
                        ("TPL"                  . std-html-alist)
                        ("XML"                  . std-html-alist)
                        ("PHP"                  . std-php-alist)
                        ("Nroff"                . std-nroff-alist)
                        ("TeX"                  . std-latex-alist)
                        ("LaTeX"                . std-latex-alist))
      )

(defun std-get (a)
  (interactive)
  (cdr (assoc a (eval (cdr (assoc mode-name std-modes-alist)))))
  )

(setq license-beer
      '("This program is under the Beerware license.\n"
	"Redistribution and use in source and binary forms, with or without\n"
	"modification, are permitted provided that the following conditions\n"
	"are met:\n"
	"\n"
	"Redistributions of source code must retain the above copyright notice,\n"
	"\n"
	"If you like this piece of code and/or what it does, you would pay me\n"
	"a beer ;-)\n"
	"\n"
	"That's all, have fun\n"
	)
      )

(setq license-gpl2
      '("This program is free software; you can redistribute it and/or modify\n"
	"it under the terms of the GNU General Public License as published by\n"
	"the Free Software Foundation; either version 2 of the License, or\n"
	"(at your option) any later version.\n"
	"\n"
	"This program is distributed in the hope that it will be useful,\n"
	"but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
	"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n"
	"GNU General Public License for more details.\n"
	"\n"
	"You should have received a copy of the GNU General Public License along\n"
	"with this program; if not, write to the Free Software Foundation, Inc.,\n"
	"51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.\n")
      )

(setq license-gpl3
      '("This program is free software: you can redistribute it and/or modify\n"
	"it under the terms of the GNU General Public License as published by\n"
	"the Free Software Foundation, either version 3 of the License, or\n"
	"(at your option) any later version.\n"
	"\n"
	"This program is distributed in the hope that it will be useful,\n"
	"but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
	"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n"
	"GNU General Public License for more details.\n"
	"\n"
	"You should have received a copy of the GNU General Public License\n"
	"along with this program.  If not, see <http://www.gnu.org/licenses/>.\n")
      )

(setq license-agpl
      '("This program is free software: you can redistribute it and/or modify\n"
	"it under the terms of the GNU Affero General Public License as published by\n"
	"the Free Software Foundation, either version 3 of the License, or\n"
	"(at your option) any later version.\n"
	"\n"
	"This program is distributed in the hope that it will be useful,\n"
	"but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
	"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n"
	"GNU Affero General Public License for more details.\n"
	"\n"
	"You should have received a copy of the GNU Affero General Public License\n"
	"along with this program.  If not, see <http://www.gnu.org/licenses/>.\n"
	"\n")
      )

(setq license-lgpl
      '("This library is free software; you can redistribute it and/or\n"
	"modify it under the terms of the GNU Lesser General Public\n"
	"License as published by the Free Software Foundation; either\n"
	"version 3 of the License, or (at your option) any later version.\n"
	"\n"
	"This library is distributed in the hope that it will be useful,\n"
	"but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
	"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU\n"
	"Lesser General Public License for more details.\n"
	"\n"
	"You should have received a copy of the GNU General Public License\n"
	"along with this program.  If not, see <http://www.gnu.org/licenses/>.\n")
      )

(setq license-fdl
      '("Permission is granted to copy, distribute and/or modify this document\n"
	"under the terms of the GNU Free Documentation License, Version 1.3\n"
	"or any later version published by the Free Software Foundation;\n"
	"with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.\n"
	"A copy of the license is included in the section entitled \"GNU\n"
	"Free Documentation License\".\n")
      )

(setq license-bsd 
      '("Redistribution and use in source and binary forms, with or without\n"
	"modification, are  permitted provided that the following conditions are\n"
	"met:\n"
	"\n"
	"  1. Redistributions of source code must retain the above copyright\n"
	"     notice, this list of conditions and the following disclaimer.\n"
	"\n"
	"  2. Redistributions in binary form must reproduce the above copyright\n"
	"     notice, this list of conditions and the following disclaimer in the\n"
	"     documentation and/or other materials provided with the distribution.\n"
	"\n"
	"  3. The name of the author may not be used to endorse or promote\n"
	"     products derived from this software without specific prior written\n"
	"     permission.\n"
	"\n"
	"THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR\n"
	"IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED\n"
	"WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE\n"
	"DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,\n"
	"INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES\n"
	"(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR\n"
	"SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)\n"
	"HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,\n"
	"STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING\n"
	"IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE\n"
	"POSSIBILITY OF SUCH DAMAGE.\n")
      )

(setq license-isc 
      '("Permission to use, copy, modify, and/or distribute this software for any\n"
	"purpose with or without fee is hereby granted, provided that the above\n"
	"copyright notice and this permission notice appear in all copies.\n"
	"\n"
	"THE SOFTWARE IS PROVIDED \"AS IS\" AND THE AUTHOR DISCLAIMS ALL WARRANTIES\n"
	"WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF\n"
	"MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR\n"
	"ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES\n"
	"WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN\n"
	"ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF\n"
	"OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.\n")
      )

(defun std-file-header ()
  "Puts a standard header at the beginning of the file.\n(According to mode)"
  (interactive)
  (goto-char (point-min))
  (let ((projname "toto")(location "titi"))
    (setq license (read-from-minibuffer
		   (format "License ? : ")))
    (setq location (getenv "PWD"))

    (insert-string (std-get 'cs))
    (newline)
    (insert-string (concat (std-get 'cc)
			   header-copyright
			   (format-time-string "%Y" (current-time))
			   " "
			   user-nickname))
    (newline)
    (setq ltow nil)
    (if (string= license "gpl")
	(setq ltow license-gpl3))
    (if (string= license "gpl3")
	(setq ltow license-gpl3))
    (if (string= license "gpl2")
	(setq ltow license-gpl2))
    (if (string= license "agpl")
	(setq ltow license-agpl))
    (if (string= license "lgpl")
	(setq ltow license-lgpl))
    (if (string= license "fdl")
	(setq ltow license-fdl))
    (if (string= license "bsd")
	(setq ltow license-bsd))
    (if (string= license "isc")
	(setq ltow license-isc))
    (if (string= license "beer")
	(setq ltow license-beer))
    (if ltow
	(progn
	  (insert-string (std-get 'cc))
	  (newline)
	  (while ltow
	    (insert-string (concat (std-get 'cc)
				   (car ltow)))
	    (setq ltow (cdr ltow)))
					;(insert-string (std-get 'ce))
					;(newline)
	  ))
    (insert-string (std-get 'ce))
    (newline)))


(defun insert-std-vertical-comments ()
  "Inserts vertical comments (according to mode)."
  (interactive)
  (beginning-of-line)
  (insert-string (std-get 'cs))
  (newline)
  (let ((ok t)(comment ""))
    (while ok
      (setq comment (read-from-minibuffer
		     (format "Type comment (RETURN to quit) : ")))
      (if (= 0 (length comment))
	  (setq ok nil)
	(progn
	  (insert-string (concat (std-get 'cc) comment))
	  (newline)))))
  (insert-string (std-get 'ce))
  (newline))

(defun std-toggle-comment ()
  "Toggles line comment on or off (according to mode)."
  (interactive)
  (save-excursion
    (let (beg end)
      (beginning-of-line)
      (setq beg (point))
      (end-of-line)
      (setq end (point))
      (save-restriction
	(if (not (equal beg end))
	    (progn
	      (narrow-to-region beg end)
	      (goto-char beg)
	      (if (search-forward (std-get 'cs) end t)
		  (progn
		    (beginning-of-line)
		    (replace-string (std-get 'cs) "")
		    (replace-string (std-get 'ce) ""))
		(progn
		  (beginning-of-line)
		  (insert-string (std-get 'cs))
		  (end-of-line)
		  (insert-string (std-get 'ce))))))))) 
  ;;  (indent-according-to-mode)
  (indent-for-tab-command)
  (next-line 1))

;;;; Generating local keymaps for exotics modes.

;;; In CPerl mode, C-c C-h is used to do some help.
;;; so it is C-c C-h h
;;; For working, it requires info pages about perl
(add-hook 'cperl-mode-hook
	  '(lambda ()
	     (define-key cperl-mode-map ""
	       'comment-region)
	     (define-key cperl-mode-map "h"
	       'std-file-header)))

;; for perl-mode
(add-hook 'perl-mode-hook
	  '(lambda ()
	     (define-key perl-mode-map ""
	       'comment-region)))

;; for all kind of lisp code
(add-hook 'emacs-lisp-mode-hook
 	  '(lambda ()
 	     (define-key emacs-lisp-mode-map  ""
 	       'comment-region)))

(add-hook 'lisp-mode-hook
 	  '(lambda ()
 	     (define-key lisp-mode-map  ""
 	       'comment-region)))



;; for La(TeX)-mode
(add-hook 'tex-mode-hook
	  '(lambda ()
	     (define-key tex-mode-map ""
	       'comment-region)))

