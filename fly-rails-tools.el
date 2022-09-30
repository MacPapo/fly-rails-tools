;;; fly-rails-tools.el --- Tools for convenience

;;; Commentary:
;;; Flying Barrel team tools for RoR development

;;; Code:

(require 'projectile-rails)

(defun fly-rails-open-on-safari ()
  "Power on Rails Server in RoR project and then open Safari."
  (interactive)
  (let ((url "http://localhost:3000"))
    (fly-open-rails-server)
    (browse-url-default-macosx-browser url)))

(defun fly-open-rails-server ()
  "Start Rails project Server."
  (unless (bufferp
           (get-buffer projectile-rails-server-buffer-name))
    (projectile-rails-server)))

(defun fly-rails-close-server ()
  "Delete Rails Server buffer and also the Rails Server buffer window."
  (interactive)
  (if (get-buffer projectile-rails-server-buffer-name)
      (save-current-buffer
        (delete-windows-on projectile-rails-server-buffer-name)
        (let ((kill-buffer-query-functions nil))
          (kill-buffer projectile-rails-server-buffer-name)
          (message "Rails server and Rails server buffer closed!!")))
    (message "No Buffer to Kill!!")))

(provide 'fly-rails-tools)

;;; fly-rails-tools.el ends here
