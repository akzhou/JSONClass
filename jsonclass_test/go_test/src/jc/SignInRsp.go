package jc

type SignInRsp struct {
	Code int8 `json:"code"`
	Msg string `json:"msg"`
	ClassRoom ClassRoom `json:"classRoom"`
}