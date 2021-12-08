require 'rspec'
require 'measure_depth'

describe 'MeasureDepth' do
  context 'using test measurement' do
    it 'should return 7' do
      expect(measure_depth('day1_sonar_sweep/test_measurements.txt')).to eq 7
    end
  end

  context 'using assignment measurement' do
    it 'should return 7' do
      expect(measure_depth('day1_sonar_sweep/measurements.txt')).to eq 1766
    end
  end
end
