package jc

type Student struct {
	Gender bool `json:"gender"`
	Number int8 `json:"number"`
	Age int16 `json:"age"`
	Grade int32 `json:"grade"`
	Level int64 `json:"level"`
	Height float32 `json:"height"`
	Weight float64 `json:"weight"`
	Name Name `json:"name"`
	TestBools []bool `json:"testBools"`
	TestInts []int64 `json:"testInts"`
	TestFloats []float32 `json:"testFloats"`
	TestStrings []string `json:"testStrings"`
}