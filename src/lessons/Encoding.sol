// SPDX-License-Identifier:MIT

pragma solidity 0.8.18;

contract Encoding {
    function combineString() public pure returns (string memory) {
        return string(abi.encodePacked("Hi Mom! ", "Miss You!"));
    }

    function concatString() public pure returns (string memory) {
        return string.concat("Hi Mom! ", "Miss You!");
    }

    function encodeNumber() public pure returns (bytes memory) {
        bytes memory number = abi.encode(1);
        return number;
    }

    function encodePackedNumber() public pure returns (bytes memory) {
        uint one = 1;
        bytes memory number = abi.encodePacked(one);
        return number;
    }

    function encodeString() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("Some strings");
        return someString;
    }

    function encodePackedString() public pure returns (bytes memory) {
        bytes memory someString = abi.encodePacked("Some strings");
        return someString;
    }

    function decodeString() public pure returns (string memory) {
        string memory someString = abi.decode(encodeString(), (string));
        return someString;
    }

    function multiEncode() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("some string", "it's Bigger");
        return someString;
    }

    function multiDecode() public pure returns (string memory, string memory) {
        (string memory someString, string memory someOtherString) = abi.decode(
            multiEncode(),
            (string, string)
        );
        return (someString, someOtherString);
    }

    function multiEncodePacked() public pure returns (bytes memory) {
        bytes memory someString = abi.encodePacked(
            "some string",
            " it's bigger"
        );
        return someString;
    }

    function multiStringCastPacked() public pure returns (string memory) {
        string memory someString = string(multiEncodePacked());
        return someString;
    }
}
