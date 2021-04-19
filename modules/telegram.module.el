;;; telegram.module.el --- Telegram setup

;;; Commentary:
;;  Telegram configration


(use-package telega
  :ensure t
  :defer t
  :bind-keymap ("C-c t" . telega-prefix-map)
  :commands (telega)
  :config
  (defun my-telega-chat-mode ()
    (set (make-local-variable 'company-backends)
         (append (list telega-emoji-company-backend
                       'telega-company-username
                       'telega-company-hashtag)
                 (when (telega-chat-bot-p telega-chatbuf--chat)
                   '(telega-company-botcmd))))
    (company-mode 1))
  (add-hook 'telega-chat-mode-hook 'my-telega-chat-mode)
  (add-hook 'telega-load-hook 'global-telega-squash-message-mode)
  (add-hook 'telega-load-hook 'global-telega-mnz-mode)

  (setq telega-emoji-use-images t)

  (setq telega-webpage-preview-size-limits nil)
  (setq telega-webpage-preview-description-limit 64)
  (setq telega-open-file-function 'browse-url-default-macosx-browser)
  (setq telega-open-message-as-file '(video audio video-note voice-note))
  (setq telega-chat-send-disable-webpage-preview t)
  (setq telega-chat-fill-column 90)
  (setq scroll-margin 3)
  (setq telega-root-default-view-function 'telega-view-two-lines)
  (setq telega-vvnote-video-cmd
        "ffmpeg -f avfoundation -s 640x480 -framerate 30 -i default -r 30 -f avfoundation -i :default -vf format=yuv420p,crop=240:240:240:40 -vcodec hevc -vb 300k -strict -2 -acodec opus -ac 1 -ab 32k"))


(provide 'telegram.module)

;;; telegram.module.el ends here
