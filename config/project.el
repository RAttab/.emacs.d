;; Shove whatever project in here that you want to use with CEDET.

(ede-cpp-root-project "recoset-platform"
		    :name "Recoset Platform"
 		    :file "~/code/platform/Makefile"
		    :include-path '("/")
		    :system-include-path '("/home/remi/dep/node/deps/v8/include"
					   "/home/remi/dep/node/src")
;;		    :spp-table '(("PREPROC_DEFINE", "VALUE"))
)
