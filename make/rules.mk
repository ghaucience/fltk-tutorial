$(ROOTDIR)/build/%.o : $(ROOTDIR)/%.c
	@$(MKDIR) $(dir $@)
	$(GCC) -c $< $(CFLAGS) $(TARGET_CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -o $@

$(ROOTDIR)/build/%.o : $(ROOTDIR)/%.cpp
	@$(MKDIR) $(dir $@)
	$(CXX) -c $< $(CXXFLAGS) $(TARGET_CXXFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -o $@

$(ROOTDIR)/build/%.o : $(ROOTDIR)/%.cxx
	@$(MKDIR) $(dir $@)
	$(CXX) -c $< $(CXXFLAGS) $(TARGET_CXXFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -o $@

clean:
	rm -rf $(ROOTDIR)/build

define LinkApp
$1: $2
	$(CXX) $2 $(LDFLAGS) $(TARGET_LDFLAGS) -o $(ROOTDIR)/build/$1
	#$(STRIP) $(ROOTDIR)/build/$1
endef

