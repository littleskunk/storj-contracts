"""Time Vault functionality."""

import pytest
from ethereum.tester import TransactionFailed
from web3.contract import Contract


@pytest.fixture

def time_vault(chain, token):
    print(token)
    return(token)