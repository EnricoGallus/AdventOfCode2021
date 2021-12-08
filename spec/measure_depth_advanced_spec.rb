require 'rspec'
require 'measure_depth_advanced'

describe 'MeasureDepth' do
  context 'using test measurement' do
    it 'should return 7' do
      expect(measure_depth_advanced('day1_sonar_sweep/test_measurements.txt')).to eq 5
    end
  end

  context 'using assignment measurement' do
    it 'should return 7' do
      expect(measure_depth_advanced('day1_sonar_sweep/measurements.txt')).to eq 1797
    end
  end
end
