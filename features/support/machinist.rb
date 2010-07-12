# require 'machinist/active_record' # or your chosen adaptor
require File.dirname(__FILE__) + '/../../spec/blueprints' # or wherever your blueprints are
Before { Sham.reset } # to reset Sham's seed between scenarios so each run has same random sequences
