
$(TESTS_OUT)/shepplogan.ra: phantom
	$(TOOLDIR)/phantom $@

$(TESTS_OUT)/shepplogan_ksp.ra: phantom
	$(TOOLDIR)/phantom -k $@

$(TESTS_OUT)/shepplogan_coil.ra: phantom
	$(TOOLDIR)/phantom -s8 -k $@


tests/test-phantom-ksp: fft nrmse $(TESTS_OUT)/shepplogan.ra $(TESTS_OUT)/shepplogan_ksp.ra
	set -e; mkdir $(TESTS_TMP) ; cd $(TESTS_TMP)						;\
	$(TOOLDIR)/fft -i 7 $(TESTS_OUT)/shepplogan_ksp.ra shepplogan_img.ra			;\
	$(TOOLDIR)/nrmse -t 0.22 $(TESTS_OUT)/shepplogan.ra shepplogan_img.ra			;\
	rm *.ra ; cd .. ; rmdir $(TESTS_TMP)
	touch $@


tests/test-phantom-noncart: traj phantom reshape nrmse $(TESTS_OUT)/shepplogan_ksp.ra
	set -e; mkdir $(TESTS_TMP) ; cd $(TESTS_TMP)						;\
	$(TOOLDIR)/traj traj.ra									;\
	$(TOOLDIR)/phantom -k -t traj.ra shepplogan_ksp2.ra					;\
	$(TOOLDIR)/reshape 7 128 128 1 shepplogan_ksp2.ra shepplogan_ksp3.ra			;\
	$(TOOLDIR)/nrmse -t 0.00001 $(TESTS_OUT)/shepplogan_ksp.ra shepplogan_ksp3.ra		;\
	rm *.ra ; cd .. ; rmdir $(TESTS_TMP) 
	touch $@


tests/test-phantom-coil: phantom fmac nrmse $(TESTS_OUT)/shepplogan.ra
	set -e; mkdir $(TESTS_TMP) ; cd $(TESTS_TMP)						;\
	$(TOOLDIR)/phantom -s8 shepplogan_coil.ra						;\
	$(TOOLDIR)/phantom -S8 coil.ra								;\
	$(TOOLDIR)/fmac $(TESTS_OUT)/shepplogan.ra coil.ra sl_coil2.ra				;\
	$(TOOLDIR)/nrmse -t 0. shepplogan_coil.ra sl_coil2.ra					;\
	rm *.ra ; cd .. ; rmdir $(TESTS_TMP)
	touch $@


tests/test-phantom-ksp-coil: phantom fft nrmse $(TESTS_OUT)/shepplogan_coil.ra
	set -e; mkdir $(TESTS_TMP) ; cd $(TESTS_TMP)						;\
	$(TOOLDIR)/phantom -s8 sl_coil2.ra							;\
	$(TOOLDIR)/fft -i 7 $(TESTS_OUT)/shepplogan_coil.ra shepplogan_cimg.ra			;\
	$(TOOLDIR)/nrmse -t 0.22 sl_coil2.ra shepplogan_cimg.ra					;\
	rm *.ra ; cd .. ; rmdir $(TESTS_TMP)
	touch $@



TESTS += tests/test-phantom-ksp tests/test-phantom-noncart tests/test-phantom-coil tests/test-phantom-ksp-coil

