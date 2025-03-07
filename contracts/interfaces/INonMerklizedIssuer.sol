// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.16;

/**
 * @dev INonMerklizedIssuer. Interface for non-merklized issuer
 */
interface INonMerklizedIssuer {
    /**
     * @dev CredentialInformation. Information about the credential
     */
    struct CredentialData {
        uint256 id;
        string[] context;
        string _type;
        uint64 issuanceDate;
        string credentialSchema;
    }

    /**
     * @dev SubjectField credential subject for the credential
     * key - name of the field
     * value - value of the field
     * rawValue - raw value of the field,
     * is used for string and double types to restore source value in W3C verifiable credential
     */
    struct SubjectField {
        string key;
        uint256 value;
        bytes rawValue;
    }

    /**
     * @dev listUserCredentialIds. Get list of user credentials identifiers
     * @param _userId user id
     */
    function listUserCredentialIds(uint256 _userId) external returns (uint256[] memory);

    /**
     * @dev getCredential. Get credential by user id and credential id.
     * Returns credential data, core claim and subject fields.
     * @param _userId user id
     * @param _credentialId credential id
     */
    function getCredential(
        uint256 _userId,
        uint256 _credentialId
    ) external returns (CredentialData memory, uint256[8] memory, SubjectField[] memory);

    /**
     * @dev getCredentialProtocolVersion. Get version of the protocol
     */
    function getCredentialProtocolVersion() external returns (string memory);
}
