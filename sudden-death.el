;;; sudden-death.el --- Totsuzen-no-Shi

;; Copyright 2012 yewton

;; Author: yewton
;; URL: https://github.com/yewton/sudden-death.el
;; Version: 0.1

;;; Commentary:

;; ＿人人人人人人＿
;; ＞　突然の死　＜
;; ￣ＹＹＹＹＹＹ￣
;; cf. https://github.com/aquarla/sudden_death

;; To install, save this on your load path and add the fallowing to
;; your .emacs file:
;;
;; (require 'sudden-death)

;; To use, activate region and type M-x sudden-death.

;;; Code:

(defun sudden-death ()
  "＿人人人人人人＿
＞　突然の死　＜
￣ＹＹＹＹＹＹ￣"
  (interactive)
  (when (region-active-p)
    (let ((lines (split-string (buffer-substring-no-properties (region-beginning) (region-end)) "\n"))
          (max-width 0)
          top middle bottom result)
      (mapc
           #'(lambda (x)
               (setq max-width (max max-width (string-width x)))) lines)
      (setq top (make-string (/ max-width 2) ?人))
      (setq middle
            (mapconcat
             #'(lambda (x)
                 (concat "＞　" x (make-string (- max-width (string-width x)) ?\ ) "　＜"))
             lines "\n"))
      (setq bottom (make-string (/ max-width 2) ?Ｙ))
      (setq result (format "＿人%s人＿\n%s\n￣Ｙ%sＹ￣" top middle bottom))
      (kill-region (region-beginning) (region-end))
      (insert result))))

;; Setup/Activation
(provide 'sudden-death)
;;; sudden-death.el ends here