// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;
contract ArrayContract {
    uint[2**20] aLotOfIntegers;
    // 请注意，下面不是一对动态数组
    // 而是一个动态数组对（即长度为2的固定大小的数组）。
    // 在Solidity中，T[k]和[]总是具有T类型元素的数组
    // 即使T本身是一个数组
    // 正因为如此，bool[2][]是一个动态数组对，其元素使bool[2].
    // 所有状态变量的数据位置都是存储
    bool[2][] pairsOfFlags;

    //newPairs被存储在memory中---这是公开合约函数的唯一可能性
    function setAllFlagPairs(bool[2][] memory newPairs) public {
        // 赋值一个存储数组会执行 newPairs 的拷贝
        //并替换完整的数组  pairsOfFlags.
        pairsOfFlags = newPairs;
    }
    struct StructType {
        uint[] content;
        uint moreInfo;
    }
    StructType s;
    function f(uint[] memory c) public {
        // 在 ``g`` 中存储一个对 ``s`` 的引用。
        StructType storage g = s;
         // 也改变了 ``s.moreInfo``.
        g.moreInfo = 2;
        // 指定一个拷贝，因为 ``g.contents`` 不是一个局部变量，
        // 而是一个局部变量的成员。
        g.content = c;
    }
    function setFlagPair (uint index,bool flagA,bool flagB) public {
        // 访问一个不存在的数组索引会引发一个异常
        pairsOfFlags[index][0] = flagA;
        pairsOfFlags[index][1] = flagB;
    }
    function changeFlagArraySize(uint newSize) public {
          // 使用push和pop是改变数组长度的唯一方法。
          if (newSize < pairsOfFlags.length){
              while(pairsOfFlags.length > newSize)
                pairsOfFlags.pop();
          } else if (newSize>  pairsOfFlags.length){
              while (pairsOfFlags.length < newSize)
                pairsOfFlags.push();
          }
    }
    function clear() public {
        // 这些完全清除了数组
        delete pairsOfFlags;
        delete aLotOfIntegers;
        //这里相同的效果
        pairsOfFlags = new bool[2][](0);
    }

    bytes byteData;
    function byteArrays(bytes memory data) public {
        // 字节数组（"byte"）是不同的，因为它们的存储没有填充，
        // 但可以与 "uint8[]"相同。
        byteData = data;
        for (uint i = 0;i < 7;i++){
            byteData.push();
        }
        byteData[3] = 0x08;
        delete byteData[2];
    }
    function addFlag(bool[2] memory flag) public returns (uint){
        pairsOfFlags.push(flag);
        return pairsOfFlags.length;
    }

    function createMemoryArray(uint size) public pure returns (bytes memory){
        // 使用 `new` 创建动态 memory 数组：
        uint[2][] memory arrayOfPairs = new uint[2][](size);
        // 内联数组总是静态大小的，如果您只使用字面常数表达式，您必须至少提供一种类型。
        arrayOfPairs[0] = [uint(1),2];
        // 创建一个动态字节数组：
        bytes memory b = new bytes(200);
        for (uint i = 0;i < b.length; i++){
            b[i] = bytes1(uint8(i));
        }
        return b;
    }


}