
(ede-cpp-root-project "dropbox"
	:name "Dropbox Chalenges"
	:file "~/code/dropbox/CMakeLists.txt"
	:include-path '("/src")
)


(ede-cpp-root-project "libyarn"
		    :name "libyarn"
		    :file "~/code/yarn/libyarn/Makefile"
		    :include-path '("/src")
		    ;; :system-include-path '("/full/path/here")
		    ;; :spp-table '(("PREPROC_DEFINE", "VALUE"))
)

(ede-cpp-root-project "yarnb"
		    :name "yarnb"
		    :file "~/code/yarn/yarnb/Makefile"
		    :include-path '("/src"
				    "../../libyarn/src"
				   )
		    ;; :system-include-path '("/full/path/here")
		    ;; :spp-table '(("PREPROC_DEFINE", "VALUE"))
)

(ede-cpp-root-project "yarnc"
		    :name "yarnc"
		    :file "~/code/yarn/yarnc/Makefile"
		    :include-path '("./include"
				    "./lib/Yarn")
		    :system-include-path '("~/code/llvm/llvm-src/include/")
		    ;; :spp-table '(("PREPROC_DEFINE", "VALUE"))
)

